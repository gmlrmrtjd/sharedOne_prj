package com.soprj.sharedone_prj.service.report;

import com.soprj.sharedone_prj.domain.order.OrderHeaderDTO;
import com.soprj.sharedone_prj.domain.report.ReportHeaderDto;
import com.soprj.sharedone_prj.mapper.report.ReportMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ReportService {

    @Autowired
    private ReportMapper reportMapper;

    public List<ReportHeaderDto> reportList() {
        return reportMapper.reportList();
    }

    public ReportHeaderDto reportDetail(int m_order_id) {
        return reportMapper.reportDetail(m_order_id);
    }

}
