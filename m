From: Tino Keitel <tkeitel@innominate.com>
Subject: How to use mark and connmark in one rule
Date: Fri, 24 Apr 2009 15:32:35 +0200
Message-ID: <20090424133235.GA14156@tkeitel002.bln.innominate.local>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi folks,

when I try to use the mark and connmark extensions in one rule, I get
an error:

$ iptables -A INPUT -m mark --mark 1 -m connmark --mark 2
iptables v1.4.2: mark: "--mark" option may only be specified once

Is this intended? If not, is there a way to make this work with a stock
iptables, or do I have to patch the source and rename one of the
options?

Regards,

-- 
Tino Keitel
Software Engineer
 
Innominate Security Technologies AG
/protecting industrial networks/
Tel: +49.30.921028-206
Fax: +49.30.921028-020
Rudower Chaussee 13
12489 Berlin / Germany
http://www.innominate.com/

Register Court: AG Charlottenburg, HRB 81603 Management Board: Dirk
Seewald, Chairman of the Supervisory Board: Volker Bibelhausen
