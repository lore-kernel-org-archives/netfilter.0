From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: rc.local
Date: Fri, 29 Jul 2005 09:55:50 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507290954550.28794@yvahk01.tjqt.qr>
References: <42e607e9.6446401e.6174.46a7SMTPIN_ADDED@mx.gmail.com>
	<9927912d0507260430275d8239@mail.gmail.com>
	<5d2f379105072608385caaee15@mail.gmail.com>
	<9927912d050726221615fe208f@mail.gmail.com>
	<5d2f37910507270942577f9173@mail.gmail.com>
	<9927912d05072800347cb45aa1@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9927912d05072800347cb45aa1@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Visham Ramsurrun <vishamr2000@gmail.com>
Cc: Netfilter User Mailing List <netfilter@lists.netfilter.org>

>Sorry got confused with the DoSed and the sed shell command..i want to
>execute the same script for each packet.
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You mean to have the same shell _process_ analyze each packet..
Check the QUEUE target.



Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/

