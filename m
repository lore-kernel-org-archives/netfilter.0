From: Gioele Barabucci <dev@gioelebarabucci.com>
Subject: Re: ESTABILISHED connections are not that estabilished
Date: Fri, 29 Jul 2005 00:04:50 +0200
Message-ID: <dcd52v$tom$1@sea.gmane.org>
References: <dc8blc$p5s$1@sea.gmane.org> <dca9si$kis$1@sea.gmane.org>
	<42E8B668.3030201@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
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

/dev/rob0 wrote:
> Gioele Barabucci wrote:
> Theory:
> # iptables -vA OUTPUT -p tcp --dport nameserver
>    tcp opt -- in * out *  0.0.0.0/0  -> 0.0.0.0/0  tcp dpt:42
> # iptables -vA OUTPUT -p tcp --dport domain
>    tcp opt -- in * out *  0.0.0.0/0  -> 0.0.0.0/0  tcp dpt:53
> I cannot see into your /etc/services, but mine resolves "nameserver" to
> "42". (R.I.P., D. Adams.)
Yes, you're right. Lucky nameserver/udp is an alias for domain/udp so some
connections went without problem.
Now that I fixed these rules, the "dig -x" problem is solved, but I can
still see DROPped packed for INPUT and OUTPUT.

>>   echo "Logging"
> Whoa, that is a lot of logging! What do you expect to find in all that?
> Why LOG and ULOG both?
Debugging stage :)

> Suggestion: OUTPUT filtering is a bad idea.
>
> Why are you doing it? What is the benefit you think you are getting?
> This sounds like a single user machine, from the fact that there's no
> routing. Who are you limiting with OUTPUT rules? Yourself?
This is a public server and I fear that some of its daemons could be used to
gain user access to the machine. None of my daemon runs as root, so if
someone get in, it will get only user privs.
I think that DROPping OUTPUT ensures that nobody will ever open the server
to the outside or use the server to connect somewhere. Am I wrong? I'm
pretty new to server management so I want to be sure that I am playing
safe.

-- 
Gioele <dev@gioelebarabucci.com>


