From: "Shazad Malik" <smalik@vistawiz.com>
Subject: Re: ip_conntrack: table full, dropping packet. - Anyone????? Frustrating!
Date: Mon, 3 Jun 2002 13:18:47 -0400 (EDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <4884.24.168.132.35.1023124727.squirrel@mail.vistawiz.com>
References: <20020603104627.Q27307@funkyjesus.org>
Reply-To: smalik@vistawiz.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020603104627.Q27307@funkyjesus.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: nickd@funkyjesus.org
Cc: netfilter@lists.samba.org

Hi Nick,

This is the output from my /proc/net/ip_conntrack:
========================
tcp      6 432000 ESTABLISHED src=192.168.100.100 dst=192.168.100.1
sport=4885 dport=22 src=192.
168.100.1 dst=192.168.100.100 sport=22 dport=4885 [ASSURED] use=1
tcp      6 431991 ESTABLISHED src=192.168.100.100 dst=24.228.35.215
sport=4884 dport=8080 src=24
.228.35.215 dst=24.168.132.35 sport=8080 dport=4884 [ASSURED] use=1
udp      17 137 src=24.168.132.35 dst=24.29.99.36 sport=45028 dport=53
src=24.29.99.36 dst=24.16
8.132.35 sport=53 dport=45028 [ASSURED] use=1
=========================

This is the output from /var/log/messages

Jun  3 08:03:28 new kernel: ip_conntrack: table full, dropping packet.
Jun  3 08:04:52 new last message repeated 7 times
Jun  3 08:04:53 new last message repeated 2 times


Seriously, I going beserk now!  I just have two machine sitting behind my
test box and just one user(thats me!). All I'm doing is surfing the web.
Dont have a clue why its happening!

shazad

> On Sun, Jun 02, 2002 at 11:25:31PM -0400, Shazad Malik wrote:
>
>> I have seen other explanations such as incresing your tcp max number
>> as your physical mem. increase.  Check you /proc/net/ip_conntrack file
>> for the current connections.  But none of these factors have anything
>> to do with this error.  I have only 2 connections, doing regular HTTP
>> gets and its filling my log file:
>>
>> Jun  2 09:50:39 new kernel: ip_conntrack: table full, dropping packet.
>> Jun  2 09:53:29 new kernel: ip_conntrack: table full, dropping packet.
>> Jun  2 09:57:14 new kernel: ip_conntrack: table full, dropping packet.
>
> What's the output of
>
> cat /proc/net/ip_conntrack
>
> look like?
>
> --
> FunkyJesus System Administration Team


-- 
Shazad Malik
work: (845)623-2161
fax: (845) 623-1154



