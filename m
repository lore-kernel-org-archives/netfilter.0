From: Sergio Basurto Juarez <sbasurtoj@yahoo.com>
Subject: Re: A DNAT question.
Date: Mon, 7 Feb 2005 07:58:58 -0800 (PST)
Message-ID: <20050207155858.25262.qmail@web41628.mail.yahoo.com>
References: <Pine.LNX.4.58.0502051918500.6532@linux>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.58.0502051918500.6532@linux>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


--- Ted Gervais <ve1drg@av.eastlink.ca> wrote:

> 
> I am new to this list and to iptables generally.
> 
> I have a line I am trying to translate into a
> current iptables line that
> will work in my firewall.
> 
> ' DNAT net loc:192.168.0.147 udp 5198,5199 '
> 
> If anyone could venture a thought as to how that
> might be translated into
> a current iptables statement I would really
> appreicate it.
> 
> I have tried - iptables -t nat -A PREROUTING -i eth0
> -d 192.168.0.1 -p tcp
> --dport 5198:5199 -j DNAT --to 192.168.0.147
> 
> That doesn't appear to work so obviously I have not
> interpreted that line
> correctly..
> 
I experienced a similar problem with a rule like
iptables -t nat -A PREROUTING -d 200.65.184.223 -j
DNAT --to 192.168.0.10

and it does not work until I put the rule at the
begining changing the -A to -I

I do not know exactly why this work but it works. I
guess that the the rules of redirecting should comes
before any other rule.


Hope this help.

=====
-- 
Sergio Basurto J.

If I have seen further it is by standing on the 
shoulders of giants. (Isaac Newton)
--


		
__________________________________ 
Do you Yahoo!? 
Yahoo! Mail - Easier than ever with enhanced search. Learn more.
http://info.mail.yahoo.com/mail_250

