import Vue from 'vue';
import PipelineSchedulesCallout from './components/pipeline_schedules_callout';

document.addEventListener('DOMContentLoaded', () => new Vue({
  el: '#pipeline-schedules-callout',
  components: {
    'pipeline-schedules-callout': PipelineSchedulesCallout,
  },
  render(createElement) {
    return createElement('pipeline-schedules-callout');
  },
}));
