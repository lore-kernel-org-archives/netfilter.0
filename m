From: "robee" <mlody@elpec.com>
Subject: Re: packets loging
Date: Fri, 21 Apr 2006 10:52:45 +0200
Message-ID: <004401c66520$f6286880$0e01050a@CyberAdmin>
References: <002d01c66445$01dd28f0$0e01050a@CyberAdmin><4447F34C.6030500@yahoo.com.mx><000d01c6650d$99afe6e0$0e01050a@CyberAdmin><60102.193.173.147.3.1145604135.squirrel@webmail.sterenborg.info><002801c66516$40ff0ae0$0e01050a@CyberAdmin>
	<51316.193.173.147.3.1145606258.squirrel@webmail.sterenborg.info>
Reply-To: robee <mlody@elpec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

----- Original Message ----- 
From: "Rob Sterenborg" <rob@sterenborg.info>
To: <netfilter@lists.netfilter.org>
Sent: Friday, April 21, 2006 9:57 AM
Subject: Re: packets loging

> On Fri, April 21, 2006 09:36, robee wrote:
>>>> but i want only this:
>>>>     Apr 21 04:09:20 master kernel: HTTP_IN=eth2 OUT=eth0 SRC=10.11.9.2
>>>> DST=213.54.82.29
>>>> any sugestion?
>>> AFAIK that isn't possible.
>>> Why would you want to anyway ?
>>> Gr,
>>> Rob
>> less data to write, less disk load
> It must be a really busy box if this is going to hog your disk space|IO.
> If you use the limit match ("-m limit --limit 1/sec" or something) your
> logging will also be less.
> Gr,
> Rob

disk space is not a problem but disk usage increased 10 times during loging 
dstport 80 only. it is a gateway for large network.
When i use limit module is it possible that loging system miss some 
significant connection? or it has influence to particular destination host?

ex:

log like:
Apr 21 04:09:20 master kernel: HTTP_IN=eth2 OUT=eth0 SRC=10.11.9.2 
DST=213.54.82.29 ...
Apr 21 04:09:20 master kernel: HTTP_IN=eth2 OUT=eth0 SRC=10.11.9.2 
DST=82.140.223.12 ...
Apr 21 04:09:20 master kernel: HTTP_IN=eth2 OUT=eth0 SRC=10.11.9.2 
DST=112.212.123.2 ...
Apr 21 04:09:21 master kernel: HTTP_IN=eth2 OUT=eth0 SRC=10.11.9.2 
DST=213.54.82.29 ...
Apr 21 04:09:22 master kernel: HTTP_IN=eth2 OUT=eth0 SRC=10.11.9.2 
DST=213.54.82.29 ...
Apr 21 04:09:23 master kernel: HTTP_IN=eth2 OUT=eth0 SRC=10.11.9.2 
DST=213.54.82.29 ...
Apr 21 04:09:24 master kernel: HTTP_IN=eth2 OUT=eth0 SRC=10.11.9.2 
DST=213.54.82.29 ...

turns to:
Apr 21 04:09:20 master kernel: HTTP_IN=eth2 OUT=eth0 SRC=10.11.9.2 
DST=213.54.82.29 ...
Apr 21 04:09:20 master kernel: HTTP_IN=eth2 OUT=eth0 SRC=10.11.9.2 
DST=82.140.223.12 ...
Apr 21 04:09:20 master kernel: HTTP_IN=eth2 OUT=eth0 SRC=10.11.9.2 
DST=112.212.123.2 ...



robee


