global class FaultyGlobalController {
    public class NonGlobalWrapper {
        public String label { get; set; }
        public Integer code { get; set; }
    }

    global static NonGlobalWrapper getData() {
        NonGlobalWrapper obj = new NonGlobalWrapper();
        obj.label = 'Invalid';
        obj.code = 404;
        return obj;
    }
}
