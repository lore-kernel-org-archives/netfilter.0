From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: nfnetlinkf ctnetlink ct-event
Date: Mon, 12 Mar 2007 19:03:14 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0703121902430.19469@yvahk01.tjqt.qr>
References: <009801c7619e$dff4adf0$7100000a@W2KMPLOURDE>
	<00a801c761ba$08ab8be0$7100000a@W2KMPLOURDE>
	<1173385184.23222.27.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1173385184.23222.27.camel@localhost>
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
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Eric Leblond <eleblond@inl.fr>
Cc: netfilter@lists.netfilter.org


On Mar 8 2007 21:19, Eric Leblond wrote:
>
>Le jeudi 08 mars 2007 à 14:43 -0500, Michael Plourde a écrit :
>> If i can patch my 2.4 kernel, is there a way to manage conntrack ?
>> (Other way than rmmod , insmod to flush all)
>
>Not really, you can only read /proc/net/ip_conntrack. One tool you can
>use is tcpkill available in dsniff. It can be used to kill some tcp
>connections by sending a TCP RST packet.

There's the "conntrack" utility, but of course, it requires something
with a little more kick, like a 2.6 series kernel.

>> ----- Original Message ----- 
>> From: "Michael Plourde" <mplourde@digicom.ca>
>> To: <netfilter@lists.netfilter.org>
>> Sent: Thursday, March 08, 2007 11:28 AM
>> Subject: nfnetlinkf ctnetlink ct-event
>> 
>> 
>> > Hi,
>> > 
>> > i want to patch my kernel 2.4.25 to use conntrack-1.00. 
>> > Could someone give me tips and URL to get those patchs? 
>> > 
>> > Thanks,
>
>Cordialement,
>-- 
>Eric Leblond <eleblond@inl.fr>
>INL
>
>
>

Jan
-- 

