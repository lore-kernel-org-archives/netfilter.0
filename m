From: "Alec Matusis" <alecm@chatango.com>
Subject: RE: "distributed router" question
Date: Sat, 24 Feb 2007 23:30:26 -0800
Message-ID: <539.336764677678$1172388665@news.gmane.org>
References: <erqqgn$omf$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <erqqgn$omf$1@sea.gmane.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: rnichols@comcats.com

Thanks Robert.

My requirement is to have a transparent proxy in some sense: the TCP packets
should be proxied by box A to a server on box B, and back from B to the
client (via A I guess). The server on box B should see the original IP
address of the client. When I do SNAT on A, the original IP becomes
invisible for box B.

Is there a way to do this without using squid, with iptables only? 

>-----Original Message-----
>From: netfilter-bounces@lists.netfilter.org 
>[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of 
>Robert Nichols
>Sent: Saturday, February 24, 2007 5:59 PM
>To: netfilter@lists.netfilter.org
>Subject: Re: "distributed router" question
>
>Alec Matusis wrote:
>> Hi Silvio,
>> 
>> Thanks for your response. 
>> 
>> I still do not understand why SNATting in B to public IP of 
>box A would not
>> work?
>> By this I mean the following:
>> 
>> 1) Client sends packet to box A ( src: 9.10.11.12 dst: 1.2.3.4 )
>> 2) Box A does DNAT (PREROUTING) to box B ( src: 9.10.11.12 
>dst: 10.0.0.2 )
>> 
>> Box B receives the packet and replies directly to the client:
>> 1) Box B does SNAT (POSTROUTING) using box A WAN as source 
>(src: 1.2.3.4
>> dst: 9.10.11.12)
>> 
>> There are two reasons why I'd like to implement it this way:
>> 
>> a) Reduce the load on box A so that the packets from B go 
>directly to the
>> client 9.10.11.12, bypassing A.
>> b) The server on box B must log the IPs of all clients (i.e. log the
>> original client IP  9.10.11.12) 
>> 
>> Thank you,
>> 
>> Alec Matusis
>
>You can make that work for UDP, but for TCP box A will see 
>only half-open
>connections (it will never see the SYN/ACK) and reject the 
>payload packets
>as invalid.
>
>-- 
>Bob Nichols         Yes, "NOSPAM" is really part of my email address.
>
>


