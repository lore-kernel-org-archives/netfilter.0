From: Sudarshan Soma <sudarshan12s@gmail.com>
Subject: iptables to add same rule
Date: Tue, 19 May 2009 11:59:38 +0530
Message-ID: <de72ca4e0905182329qe701121ud7377177687be7f3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=63YSHjH1n1zweoZKyMU2tqJRxyBdOMDlxbYU+KZNVdM=;
        b=efTN4TDIVuF8SrSzbzsONvWv4Zma/B9ivL4KQp9brN4emXXlQyP8Y7QtFUJBLTBNY5
         nQkaGCrG1ZBNnPLmPTNilpHlKCrDZLnMZaD/g80lTx1ma1LUNsiSsgAuVlXoZ/yTGOzm
         grHXdflCwbEu2T4jPlUHRH/tNGVV4/FMIaaMI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi All,
I am trying to present WUI for iptables with simple functionality such
as add/delete rule. For adding rule, can i avoid adding the same rule
again.
Suppose, if the user tries to block ftp from outside. I will add
iptable rule as below:
iptables -A INPUT -p tcp --dport 21 -j DROP

If the user tries to add the same rule again, can i somehow determine
through iptables , if the rule is already added.

Thanks and Regards,
Pavan
