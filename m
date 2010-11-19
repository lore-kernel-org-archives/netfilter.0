From: =?ISO-8859-1?Q?Salih_G=F6n=FCll=FC?= <sag@open.ch>
Subject: Global logging limit
Date: Fri, 19 Nov 2010 16:38:19 +0100
Message-ID: <4CE699EB.1040100@open.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


Hi,

I am trying to enforce a global logging limit on my rule set. I would to 
like to be able to refer log entries to the causing rule too.

Here is what I am thinking of:


-N LogLimit
-A LogLimit -m limit --limit 3333/sec --limitburst 3000 -m MARK 
--set-mark  $LOGGING_MARK
-A LogLimit -j RETURN

....

-A ruleid:7906::: -p tcp -m tcp --dport 21 -j LogLimit
-A ruleid:7906::: -m MARK --mark $LOGGIN_MARK -j NFLOG --nflog-group 2 
--nflog-prefix "DROP by 7906"
-A ruleid:7906::: DROP

....

-A ruleid:7910::: -p tcp -m tcp --dport 389 -j LogLimit
-A ruleid:7910::: -m MARK --mark $LOGGIN_MARK -j NFLOG --nflog-group 2 
--nflog-prefix "DROP by 7910"
-A ruleid:7910::: DROP


Would I be paying a lot in term of performance by sending all dropped 
packets to the LogLimit chain ? I am using ulogd2, would it be better to 
put the limit in ulogd2 ?

Regards,

   -salih
