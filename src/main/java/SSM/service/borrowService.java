package SSM.service;

import SSM.pojo.Borrow;
import com.github.pagehelper.PageInfo;

public interface borrowService {

    PageInfo<Borrow> getAllBorrow(Integer PageNo);

    PageInfo<Borrow> getAllBorrowBySearch(Integer PageNo, String username, String bookName);

    void AddBorrow(Borrow borrow);

    void DeleteBorrow(Integer id);

    void UpdateBorrow(Borrow borrow);

    Borrow getBorrowById(Integer id);
}
