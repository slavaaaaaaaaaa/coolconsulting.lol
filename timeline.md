---
layout: page
title: Timeline generator
permalink: /timeline/
toplink: false
---

<script crossorigin src="https://unpkg.com/react@18/umd/react.production.min.js"></script>
<script crossorigin src="https://unpkg.com/react-dom@18/umd/react-dom.production.min.js"></script>
<script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
<script src="https://cdn.tailwindcss.com"></script>

<body>
  <div id="root"></div>

  <script type="text/babel">
    const { useState } = React;

    // Lucide React icons as inline SVG components
    const Calendar = ({ className, size = 24 }) => (
      <svg xmlns="http://www.w3.org/2000/svg" width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className={className}>
        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
        <line x1="16" y1="2" x2="16" y2="6"></line>
        <line x1="8" y1="2" x2="8" y2="6"></line>
        <line x1="3" y1="10" x2="21" y2="10"></line>
      </svg>
    );

    const Plus = ({ size = 24 }) => (
      <svg xmlns="http://www.w3.org/2000/svg" width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
        <line x1="12" y1="5" x2="12" y2="19"></line>
        <line x1="5" y1="12" x2="19" y2="12"></line>
      </svg>
    );

    const Trash2 = ({ size = 24 }) => (
      <svg xmlns="http://www.w3.org/2000/svg" width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
        <polyline points="3 6 5 6 21 6"></polyline>
        <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
        <line x1="10" y1="11" x2="10" y2="17"></line>
        <line x1="14" y1="11" x2="14" y2="17"></line>
      </svg>
    );

    const ChevronLeft = ({ size = 24 }) => (
      <svg xmlns="http://www.w3.org/2000/svg" width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
        <polyline points="15 18 9 12 15 6"></polyline>
      </svg>
    );

    const ChevronRight = ({ size = 24 }) => (
      <svg xmlns="http://www.w3.org/2000/svg" width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
        <polyline points="9 18 15 12 9 6"></polyline>
      </svg>
    );

    const Edit = ({ size = 24 }) => (
      <svg xmlns="http://www.w3.org/2000/svg" width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
      </svg>
    );

    function TaskTimeline() {
      const [tasks, setTasks] = useState([
        {
          id: 1,
          name: 'Database Task',
          startDate: '2025-10-23',
          endDate: '2025-10-25',
          color: 'bg-blue-500'
        },
        {
          id: 2,
          name: 'API Service Task',
          startDate: '2025-10-24',
          endDate: '2025-10-26',
          color: 'bg-green-500'
        }
      ]);

      const [viewStart, setViewStart] = useState('2025-10-22');
      const [viewEnd, setViewEnd] = useState('2025-10-28');
      const [showAddForm, setShowAddForm] = useState(false);
      const [newTask, setNewTask] = useState({
        name: '',
        startDate: '',
        endDate: '',
        color: 'bg-purple-500'
      });

      const colors = [
        'bg-blue-500', 'bg-green-500', 'bg-purple-500',
        'bg-orange-500', 'bg-pink-500', 'bg-teal-500',
        'bg-indigo-500', 'bg-red-500', 'bg-yellow-500'
      ];

      const getDatesInRange = (start, end) => {
        const dates = [];
        const currentDate = new Date(start + 'T00:00:00');
        const endDate = new Date(end + 'T00:00:00');

        while (currentDate <= endDate) {
          dates.push(new Date(currentDate).toISOString().split('T')[0]);
          currentDate.setDate(currentDate.getDate() + 1);
        }
        return dates;
      };

      const dates = getDatesInRange(viewStart, viewEnd);

      const addTask = () => {
        if (newTask.name && newTask.startDate && newTask.endDate) {
          setTasks([...tasks, {
            id: Date.now(),
            name: newTask.name,
            startDate: newTask.startDate,
            endDate: newTask.endDate,
            color: newTask.color
          }]);

          setNewTask({
            name: '',
            startDate: '',
            endDate: '',
            color: 'bg-purple-500'
          });
          setShowAddForm(false);
        }
      };

      const deleteTask = (id) => {
        setTasks(tasks.filter(m => m.id !== id));
      };

      const startEditTask = (task) => {
        setEditingTask({
          ...task
        });
      };

      const updateTask = () => {
        if (editingTask.name && editingTask.startDate && editingTask.endDate) {
          setTasks(tasks.map(m =>
            m.id === editingTask.id
              ? {
                  ...editingTask
                }
              : m
          ));
          setEditingTask(null);
        }
      };

      const adjustTimeScale = (days) => {
        const newStart = new Date(viewStart + 'T00:00:00');
        newStart.setDate(newStart.getDate() + days);
        setViewStart(newStart.toISOString().split('T')[0]);

        const newEnd = new Date(viewEnd + 'T00:00:00');
        newEnd.setDate(newEnd.getDate() + days);
        setViewEnd(newEnd.toISOString().split('T')[0]);
      };

      const getTaskPosition = (task) => {
        const startIndex = dates.indexOf(task.startDate);
        const endIndex = dates.indexOf(task.endDate);

        if (startIndex === -1 || endIndex === -1) return null;

        const left = (startIndex / dates.length) * 100;
        const width = ((endIndex - startIndex + 1) / dates.length) * 100;

        return { left: `${left}%`, width: `${width}%` };
      };

      const [draggedTask, setDraggedTask] = useState(null);
      const [dragOffset, setDragOffset] = useState(0);
      const [editingTask, setEditingTask] = useState(null);

      const formatDate = (dateStr) => {
        const date = new Date(dateStr + 'T00:00:00');
        return date.toLocaleDateString('en-US', { month: 'short', day: 'numeric' });
      };

      const getDayOfWeek = (dateStr) => {
        const date = new Date(dateStr + 'T00:00:00');
        return date.toLocaleDateString('en-US', { weekday: 'short' });
      };

      const handleDragStart = (e, task) => {
        setDraggedTask(task);
        const rect = e.currentTarget.getBoundingClientRect();
        setDragOffset(e.clientX - rect.left);
      };

      const handleDragOver = (e) => {
        e.preventDefault();
      };

      const handleDrop = (e) => {
        e.preventDefault();
        if (!draggedTask) return;

        const timelineRect = e.currentTarget.getBoundingClientRect();
        const relativeX = e.clientX - timelineRect.left - dragOffset;
        const dayWidth = timelineRect.width / dates.length;
        const newStartIndex = Math.max(0, Math.min(Math.floor(relativeX / dayWidth), dates.length - 1));

        const oldStartIndex = dates.indexOf(draggedTask.startDate);
        const oldEndIndex = dates.indexOf(draggedTask.endDate);
        const duration = oldEndIndex - oldStartIndex;

        const newStartDate = dates[newStartIndex];
        const newEndIndex = Math.min(newStartIndex + duration, dates.length - 1);
        const newEndDate = dates[newEndIndex];

        setTasks(tasks.map(m =>
          m.id === draggedTask.id
            ? { ...m, startDate: newStartDate, endDate: newEndDate }
            : m
        ));

        setDraggedTask(null);
      };

      return (
        <div className="w-full max-w-7xl mx-auto p-4 bg-gradient-to-br from-slate-50 to-slate-100 rounded-xl shadow-lg">
          <div className="mb-4">
            <h1 className="text-2xl font-bold text-slate-800 mb-1 flex items-center gap-2">
              <Calendar className="text-blue-600" size={24} />
              Task Timeline
            </h1>
          </div>

          {/* Time Scale Controls */}
          <div className="bg-white rounded-lg p-3 mb-3 shadow-sm">
            <div className="flex items-center gap-4 flex-wrap">
              <div className="flex items-center gap-2">
                <label className="text-xs font-medium text-slate-700">Start:</label>
                <input
                  type="date"
                  value={viewStart}
                  onChange={(e) => setViewStart(e.target.value)}
                  className="border border-slate-300 rounded px-2 py-1 text-xs focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
              </div>
              <div className="flex items-center gap-2">
                <label className="text-xs font-medium text-slate-700">End:</label>
                <input
                  type="date"
                  value={viewEnd}
                  onChange={(e) => setViewEnd(e.target.value)}
                  className="border border-slate-300 rounded px-2 py-1 text-xs focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
              </div>
              <div className="flex gap-2 ml-auto">
                <button
                  onClick={() => adjustTimeScale(-1)}
                  className="p-1.5 bg-slate-200 hover:bg-slate-300 rounded transition-colors"
                  title="Shift timeline back 1 day"
                >
                  <ChevronLeft size={16} />
                </button>
                <button
                  onClick={() => adjustTimeScale(1)}
                  className="p-1.5 bg-slate-200 hover:bg-slate-300 rounded transition-colors"
                  title="Shift timeline forward 1 day"
                >
                  <ChevronRight size={16} />
                </button>
              </div>
            </div>
          </div>

          {/* Timeline */}
          <div className="bg-white rounded-lg p-4 shadow-sm mb-4">
            {/* Date Headers */}
            <div className="flex border-b-2 border-slate-300 pb-1 mb-2">
              {dates.map((date) => (
                <div
                  key={date}
                  className="flex-1 text-center"
                >
                  <div className="text-xs font-semibold text-slate-700">
                    {formatDate(date)}
                  </div>
                  <div className="text-xs text-slate-500">
                    {getDayOfWeek(date)}
                  </div>
                </div>
              ))}
            </div>

            {/* Task Bars */}
            <div
              className="space-y-2"
              onDragOver={handleDragOver}
              onDrop={handleDrop}
            >
              {tasks.map((task) => {
                const position = getTaskPosition(task);
                if (!position) return null;

                return (
                  <div key={task.id} className="relative h-10 bg-slate-100 rounded group">
                    <div
                      draggable
                      onDragStart={(e) => handleDragStart(e, task)}
                      className={`absolute top-0 h-full ${task.color} rounded shadow-sm flex items-center px-3 overflow-hidden transition-all hover:shadow-md group-hover:opacity-90 cursor-move ${
                        draggedTask?.id === task.id ? 'opacity-50' : ''
                      }`}
                      style={position}
                    >
                      <div className="text-white text-sm font-semibold truncate">
                        {task.name}
                      </div>
                    </div>
                    <div className="absolute right-2 top-1/2 -translate-y-1/2 flex gap-1 opacity-0 group-hover:opacity-100">
                      <button
                        onClick={() => startEditTask(task)}
                        className="text-slate-400 hover:text-blue-500 p-1 rounded hover:bg-white/50 transition-colors"
                      >
                        <Edit size={14} />
                      </button>
                      <button
                        onClick={() => deleteTask(task.id)}
                        className="text-slate-400 hover:text-red-500 p-1 rounded hover:bg-white/50 transition-colors"
                      >
                        <Trash2 size={14} />
                      </button>
                    </div>
                  </div>
                );
              })}
            </div>

            {tasks.length === 0 && (
              <div className="text-center py-6 text-slate-400 text-sm">
                No tasks added yet. Click the button below to add your first task.
              </div>
            )}
          </div>

          {/* Add Task Form */}
          {!showAddForm ? (
            <button
              onClick={() => setShowAddForm(true)}
              className="flex items-center gap-2 px-3 py-1.5 bg-blue-600 text-white text-sm rounded-lg hover:bg-blue-700 transition-colors shadow-sm"
            >
              <Plus size={16} />
              Add Task
            </button>
          ) : (
            <div className="bg-white rounded-lg p-4 shadow-sm">
              <h3 className="text-base font-semibold mb-3 text-slate-800">Add New Task</h3>
              <div className="space-y-3">
                <div>
                  <label className="block text-xs font-medium text-slate-700 mb-1">
                    Task Name
                  </label>
                  <input
                    type="text"
                    value={newTask.name}
                    onChange={(e) => setNewTask({ ...newTask, name: e.target.value })}
                    placeholder="e.g., Database Task"
                    className="w-full border border-slate-300 rounded px-2 py-1.5 text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                  />
                </div>
                <div className="grid grid-cols-2 gap-3">
                  <div>
                    <label className="block text-xs font-medium text-slate-700 mb-1">
                      Start Date
                    </label>
                    <input
                      type="date"
                      value={newTask.startDate}
                      onChange={(e) => setNewTask({ ...newTask, startDate: e.target.value })}
                      className="w-full border border-slate-300 rounded px-2 py-1.5 text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                    />
                  </div>
                  <div>
                    <label className="block text-xs font-medium text-slate-700 mb-1">
                      End Date
                    </label>
                    <input
                      type="date"
                      value={newTask.endDate}
                      onChange={(e) => setNewTask({ ...newTask, endDate: e.target.value })}
                      className="w-full border border-slate-300 rounded px-2 py-1.5 text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                    />
                  </div>
                </div>
                <div>
                  <label className="block text-xs font-medium text-slate-700 mb-1.5">
                    Color
                  </label>
                  <div className="flex gap-1.5 flex-wrap">
                    {colors.map((color) => (
                      <button
                        key={color}
                        onClick={() => setNewTask({ ...newTask, color })}
                        className={`w-8 h-8 ${color} rounded transition-transform ${
                          newTask.color === color ? 'ring-2 ring-slate-400 scale-110' : 'hover:scale-105'
                        }`}
                      />
                    ))}
                  </div>
                </div>
                <div className="flex gap-2 pt-1">
                  <button
                    onClick={addTask}
                    className="px-3 py-1.5 bg-blue-600 text-white text-sm rounded-lg hover:bg-blue-700 transition-colors"
                  >
                    Add Task
                  </button>
                  <button
                    onClick={() => setShowAddForm(false)}
                    className="px-3 py-1.5 bg-slate-200 text-slate-700 text-sm rounded-lg hover:bg-slate-300 transition-colors"
                  >
                    Cancel
                  </button>
                </div>
              </div>
            </div>
          )}

          {/* Edit Task Form */}
          {editingTask && (
            <div className="bg-white rounded-lg p-4 shadow-sm mt-3 border-2 border-blue-500">
              <h3 className="text-base font-semibold mb-3 text-slate-800">Edit Task</h3>
              <div className="space-y-3">
                <div>
                  <label className="block text-xs font-medium text-slate-700 mb-1">
                    Task Name
                  </label>
                  <input
                    type="text"
                    value={editingTask.name}
                    onChange={(e) => setEditingTask({ ...editingTask, name: e.target.value })}
                    placeholder="e.g., Database Task"
                    className="w-full border border-slate-300 rounded px-2 py-1.5 text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                  />
                </div>
                <div className="grid grid-cols-2 gap-3">
                  <div>
                    <label className="block text-xs font-medium text-slate-700 mb-1">
                      Start Date
                    </label>
                    <input
                      type="date"
                      value={editingTask.startDate}
                      onChange={(e) => setEditingTask({ ...editingTask, startDate: e.target.value })}
                      className="w-full border border-slate-300 rounded px-2 py-1.5 text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                    />
                  </div>
                  <div>
                    <label className="block text-xs font-medium text-slate-700 mb-1">
                      End Date
                    </label>
                    <input
                      type="date"
                      value={editingTask.endDate}
                      onChange={(e) => setEditingTask({ ...editingTask, endDate: e.target.value })}
                      className="w-full border border-slate-300 rounded px-2 py-1.5 text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                    />
                  </div>
                </div>
                <div>
                  <label className="block text-xs font-medium text-slate-700 mb-1.5">
                    Color
                  </label>
                  <div className="flex gap-1.5 flex-wrap">
                    {colors.map((color) => (
                      <button
                        key={color}
                        onClick={() => setEditingTask({ ...editingTask, color })}
                        className={`w-8 h-8 ${color} rounded transition-transform ${
                          editingTask.color === color ? 'ring-2 ring-slate-400 scale-110' : 'hover:scale-105'
                        }`}
                      />
                    ))}
                  </div>
                </div>
                <div className="flex gap-2 pt-1">
                  <button
                    onClick={updateTask}
                    className="px-3 py-1.5 bg-blue-600 text-white text-sm rounded-lg hover:bg-blue-700 transition-colors"
                  >
                    Update Task
                  </button>
                  <button
                    onClick={() => setEditingTask(null)}
                    className="px-3 py-1.5 bg-slate-200 text-slate-700 text-sm rounded-lg hover:bg-slate-300 transition-colors"
                  >
                    Cancel
                  </button>
                </div>
              </div>
            </div>
          )}
        </div>
      );
    }

    const root = ReactDOM.createRoot(document.getElementById('root'));
    root.render(<TaskTimeline />);
  </script>
</body>