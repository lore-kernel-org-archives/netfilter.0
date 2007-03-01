From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: redirect to proxy servere
Date: Thu, 1 Mar 2007 17:11:05 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0703011710340.23355@yvahk01.tjqt.qr>
References: <20070301071927.klbsuhgk2sscscs8@mail.harrisonburg.k12.va.us>
	<Pine.LNX.4.61.0703011359540.23355@yvahk01.tjqt.qr>
	<20070301085019.ie8pp1zmqso8sssw@webmail.harrisonburg.k12.va.us>
	<20070301090918.0b6l0ssqqsww8g0g@webmail.harrisonburg.k12.va.us>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070301090918.0b6l0ssqqsww8g0g@webmail.harrisonburg.k12.va.us>
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
To: dhottinger@harrisonburg.k12.va.us
Cc: netfilter@lists.netfilter.org


On Mar 1 2007 09:09, dhottinger@harrisonburg.k12.va.us wrote:
>> > > 
>> > > $IPC -A TOSERVERS -p tcp --dport 8080 -d 204.111.40.10 -i $L3 -j
>> > > LACCEPT
>> > > $IPC -A TOSERVERS -p tcp --dport 8080 -d 204.111.40.10 -i $L3 -j
>> > > LACCEPT
>> > > $IPC -A TOSERVERS -p tcp --dport 9011:9015 -d 204.111.40.10 -i $L3
>> > > -j LACCEPT
>> > > $IPC -A TOSERVERS -p tcp --dport 10000 -d 204.111.40.10 -i $L3 -j
>> > > LACCEPT

This is just filtering. If you do not want things to be NAT'ed,
do it in the nat table.


Jan
-- 

