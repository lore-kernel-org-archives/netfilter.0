From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IP Traffic Accounting
Date: Sat, 22 Jun 2002 15:09:01 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020622140903.YSRU2755.mta05-svc.ntlworld.com@there>
References: <NFBBLDBMIDIOFPBNLEAJCEIOCHAA.yomega@wahooo.net> <20020622100049.32188874.eelf@sympatico.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020622100049.32188874.eelf@sympatico.ca>
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

On Saturday 22 June 2002 3:00 pm, David B Harris wrote:

> I'd suggest you use iptable's byte-counting instead. 'iptables -L -n -v -x'

Thanks, David - I forgot the '-x' in my version, and this makes the numbers 
an awful lot easier to process :-)

> will list the bytes which have _crossed_ each given rule. (So it
> won't just count which packets have matched.)

I'm not sure I agree with this - I believe the byte / packet counters only 
count packets matched by the rule, so that if you have the rules:

iptables -A FORWARD -p tcp --dport 25 -j ACCEPT
iptables -A FORWARD -p tcp --dport 110 -j ACCEPT

the counters for the first one will only show you SMTP traffic, and the 
counters for the second one will only show you POP3 traffic.

 

Antony.

