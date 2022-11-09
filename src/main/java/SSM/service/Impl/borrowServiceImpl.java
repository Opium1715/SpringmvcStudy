package SSM.service.Impl;

import SSM.mapper.BorrowMapper;
import SSM.pojo.Borrow;
import SSM.service.borrowService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class borrowServiceImpl implements borrowService {
    @Autowired
    private BorrowMapper borrowMapper;
    @Override
    public PageInfo<Borrow> getAllBorrow(Integer PageNo) {
        PageHelper.startPage(PageNo,9);
        List<Borrow> borrowList = borrowMapper.selectAll(null,null);
        return new PageInfo<>(borrowList);
    }

    @Override
    public PageInfo<Borrow> getAllBorrowBySearch(Integer PageNo, String username, String bookName) {
        PageHelper.startPage(PageNo,9);
        List<Borrow> borrowList = borrowMapper.selectAll(username,bookName);
        return new PageInfo<>(borrowList);
    }

    @Override
    public void AddBorrow(Borrow borrow) {
        borrowMapper.insert(borrow);
    }

    @Override
    public void DeleteBorrow(Integer id) {
        borrowMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void UpdateBorrow(Borrow borrow) {
        borrowMapper.updateByPrimaryKey(borrow);
    }

    @Override
    public Borrow getBorrowById(Integer id) {
        return borrowMapper.selectByPrimaryKey(id);
    }
}
