From: Gabriel <jarod125@yahoo.com>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Thu, 10 Nov 2005 05:13:37 -0800 (PST)
Message-ID: <20051110131337.82429.qmail@web60919.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 10 Nov 2005 14:44:53 +0200, Adam Rosi-Kessel  
<adam@rosi-kessel.org> wrote:

> George Alexandru Dragoi wrote:
>> Better use mangle table, all packets traverse it. And
doesn't require
>> conntrack.
>
> But I can't do DNAT in mangle, right?

You cannot. nat and mangle are two different chains.

"Note that the DNAT target is only available within the
PREROUTING and  
OUTPUT chains in the nat table" from  
http://iptables-tutorial.frozentux.net/iptables-tutorial.html#DNATTARGET

-- 
Using Opera's revolutionary e-mail client: http://www.opera.com/mail/


		
__________________________________ 
Yahoo! FareChase: Search multiple travel sites in one click.
http://farechase.yahoo.com

