from rx import Observable
from rx.subjects import Subject
import time
import threading

numbers = Observable.from_([1, 2, 3, 4, 5, 6])
numbers.buffer_with_count(3).subscribe(
    on_next=lambda i: print("on_next {}".format(i)),
    on_error=lambda e: print("on_error: {}".format(e)),
    on_completed=lambda: print("on_completed")
)
