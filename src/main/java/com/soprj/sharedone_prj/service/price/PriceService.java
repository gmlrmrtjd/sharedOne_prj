package com.soprj.sharedone_prj.service.price;

import com.soprj.sharedone_prj.domain.price.PriceDto;
import com.soprj.sharedone_prj.mapper.price.PriceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class PriceService {

    @Autowired
    private PriceMapper priceMapper;

    public List<PriceDto> getPriceList(int page, String type, String keyword, PriceDto priceDto) {
        int records = 10;
        int offset = (page - 1) * records;

        int countAll = priceMapper.countAll(type, "%"+keyword+"%");
        int lastPage = (countAll - 1) / records + 1;

        int leftPageNumber = (page -1) / 10 * 10 + 1;
        int rightPageNumber = leftPageNumber + 9;
        rightPageNumber = Math.min(rightPageNumber, lastPage);

        // 이전버튼 유무
        boolean hasPrevButton = page > 10;
        // 다음버튼 유무
        boolean hasNextButton = page <= ((lastPage - 1) / 10 * 10);

        // 이전버튼 눌렀을 때 가는 페이지 번호
        int jumpPrevPageNumber = (page - 1) / 10 * 10 - 9;
        int jumpNextPageNumber = (page - 1) / 10 * 10 + 11;

        priceDto.setHasPrevButton(hasPrevButton);
        priceDto.setHasNextButton(hasNextButton);
        priceDto.setJumpPrevPageNumber(jumpPrevPageNumber);
        priceDto.setJumpNextPageNumber(jumpNextPageNumber);
        priceDto.setCurrentPageNumber(page);
        priceDto.setLeftPageNumber(leftPageNumber);
        priceDto.setRightPageNumber(rightPageNumber);
        priceDto.setLastPageNumber(lastPage);

        return priceMapper.getPriceList(offset, records, type, "%"+keyword+"%");
    }


    public int register(PriceDto price) {
        return priceMapper.insertRegister(price);
    }

    public PriceDto getById(int m_price_id) {
        return priceMapper.selectById(m_price_id);
    }

    public int getByIdModify(PriceDto priceDto) {
        return priceMapper.updateById(priceDto);
    }

    public PriceDto buyerList(String m_buyer_id) {
        return priceMapper.buyerList(m_buyer_id);
    }

    public PriceDto itemList(String m_item_id) {
        return priceMapper.itemList(m_item_id);
    }

    public List<PriceDto> getBuyerList() {
        return priceMapper.getBuyerList();
    }

    public List<PriceDto> getItemList() {
        return priceMapper.getItemList();
    }


    public int remove(String removeList) {
        return priceMapper.remove(removeList);
    }


    public List<PriceDto> getPricePeriod(PriceDto priceDto) {
        return priceMapper.getPricePeriod(priceDto);
    }


    public LocalDate getAfterStartPeriod(PriceDto priceDto) {
        return priceMapper.getAfterStartPeriod(priceDto);
    }

    public int addPriceData(Map<String, Object> stringObjectMap) {
        return priceMapper.addPriceData(stringObjectMap);
    }

    public List<PriceDto> getPriceModifyPeriod(PriceDto priceDto) {
        return priceMapper.getPriceModifyPeriod(priceDto);
    }

    public LocalDate getAfterStartModifyPeriod(PriceDto priceDto) {
        return priceMapper.getAfterStartModifyPeriod(priceDto);
    }
}
