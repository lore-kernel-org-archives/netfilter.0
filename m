From: "Mike O" <mikeeo@msn.com>
Subject: RE: Is Linux based Gateway/Firewall feasible
Date: Thu, 08 Jul 2004 13:21:36 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY4-F14s1UAuiJ1yhn000561d1@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'd like to chime in here considering I brought this topic up a few years 
ago. From a standpoint of routing data from one subnet to another with high 
speed serial interfaces etc.. nothing beats a cisco. Cisco routers have 
special ASIC(application specific intergrated circuits) that do nothing but 
routing and other features.

Now from a firewall standpoint, this is were Linux really shines. Cisco PIX 
firewalls are all based on Intel processors (even celeron) and PC 
architecture. So any machine with a 1ghz and gig of memory should out 
perform any PIX firewall. One thing PIX does bring to the table is failover 
but its expensive. I think any properly configured Linux cluster could give 
PIX failover a run for there money. Price a PIX 525 to a redundant Dell or 
HP slimline with Linux and I think you will be surprised.

-Mike


>From: Sudheer Divakaran <sudheer@svw.com>
>To: netfilter@lists.netfilter.org
>Subject: Is Linux based Gateway/Firewall feasible
>Date: Thu, 08 Jul 2004 17:40:33 +0530
>
>Hi,
>
>I've a local LAN consisting of about 150 machines.  I'm using a machine 
>with Linux + IPTables  as the gateway machine which inturn connects to two 
>different ISPs.  My question is can a Linux based machine match the 
>performance of a hardware based routers provided by Cisco,... OR is my 
>decision to go for a Linux based solution is a wrong one?.
>
>Is there so much difference between these two solutions?
>
>Can I achieve the same performance using a high end PC and Linux?
>
>I'm asking this because one guy told me that my decision to go for a Linux 
>based solution is a wrong one and it can never match the performance of 
>hardware based Routers.
>
>Thanks
>Sudheer
>



