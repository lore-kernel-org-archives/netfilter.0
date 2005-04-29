From: "Ken Hilliard" <ken@acotec.com>
Subject: RE: ICMP types
Date: Sat, 30 Apr 2005 02:49:33 +0700
Message-ID: <000101c54cf4$955d5460$6363a8c0@compaq>
References: <opsp1jegtv76nf2y@xonix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <opsp1jegtv76nf2y@xonix>
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
To: 'Netfilter list' <netfilter@lists.netfilter.org>

In reading different firewall scripts/tutorials many of them recommend
filtering ICMP packets. I added ICMP filter in my firewall but was
unsure of the value as well. What is the consensus view out there?

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Sertys
Sent: Saturday, April 30, 2005 5:29 PM
To: Netfilter list
Subject: Re: ICMP types

On Sat, 30 Apr 2005 14:53:23 +0500, <varun_saa@vsnl.net> wrote:

http://www.iana.org/assignments/icmp-parameters
Use this URL to learn more about the ICMP protocol. It's an interesting

reading. I wouldn't consider forbidding ICMP at all unless you've go
dDoS  
attacks on ICMP(like microsoft). It's a control message protocol anyway.

> Hello,
>       As I understand there are more one
> type of ICMP ping.
>
> What are these types and should they
> all be allowed in iptables rules ?
>
> Thanks
>
> Varun
>



-- 
www.supportivo.org

I can't stop myself checking for pigs in the outlets. Everybody thinks
i'm  
a punk, cause of the hairstyle(220V).
end




