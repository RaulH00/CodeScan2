global class GlobalController {
    global class MyWrapper {
        public String name { get; set; }
        public Integer value { get; set; }
    }

    global static MyWrapper getWrapper() {
        MyWrapper wrapper = new MyWrapper();
        wrapper.name = 'Sample';
        wrapper.value = 10;
        return wrapper;
    }
}
