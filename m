From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: what's the funcion of ip_nat_ftp and ip__conntack_ftp modules?
Date: Tue, 4 Jun 2002 10:41:01 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206040941.g549f1A31884@Networker.rockstone.co.uk>
References: <LLEJLJOMFGPFJFEGAKBJEECJCBAA.luoqiang@ict.ac.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <LLEJLJOMFGPFJFEGAKBJEECJCBAA.luoqiang@ict.ac.cn>
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
To: netfilter@lists.samba.org

On Monday 03 June 2002 9:50 am, luoqiang wrote:

> Hi
>
> I do DNAT with only one rule:
> iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o eth0 -j SNAT --to
> xxx.xxx.xxx.xxx The host whose IP is 192.168.1.2 in NAT can use ftp(passive
> mode) in this condition,in which there are only two modules
> working------ip_tables.o and iptable_nat.o. I don't know what's the
> function of ip_nat_ftp and ip__conntack_ftp module. IF I don't use the rule
> above,ftp can't work even I insmod them.
> Then what's the function of them?

Hi.

I've only just seen the text of this email, even though I replied to it 
yesterday - I only saw the subject then, because of the 'gb2312' charset 
encoding on the body, which my mailer simply didn't display.   I thought you 
had simply posted a question in the subject with no further information :-)

The reason you can do passive ftp from your internal machine to an external 
server, as described above, is that in passive mode, everything is controlled 
from the client end; both control and data connections are initiated from the 
client, and therefore your standard SNAT rule works.

This rule would not, however, allow you to:

a) do active ftp
b) do passive or active ftp from the outside to the inside

These are what the ip_nat_ftp and ip_conntrack_ftp modules are for.

ip_nat_ftp handles active ftp, and ip_conntrack_ftp allows you to specify 
ESTABLISHED and RELATED packets in your FORWARDING rule (I'm guessing that at 
present your FORWARD chain is pretty simple, right ?), which otherwise 
wouldn't recognise the ftp responses as such.

Hope this helps,


Antony.

