From: Luiz Fernando Estivalet <luizfernando_estivalet@yahoo.com>
Subject: problem with iptables+local transparent proxy
Date: Fri, 23 Apr 2004 22:20:09 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040424052009.74042.qmail@web21322.mail.yahoo.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

HI there!
I have in my notebook iptables and squid installed.
My squid configuration is OK and it is setup to
support transparent proxy. I access the internet with
ppp in this notebook and I want to configure it as
transparent proxy.Today I have the proxy configuration
in netscape. The squid is running in its default port
3128. I want to remove this configuration and
redirects all access to the web to squid.

What I have seen here is that all output to the
internet is passing in the main OUTPUT chain and not
in OUTPUT from the nat table (I have put some messages
in the log to view it).I have seen rules for redirect
the output from nat to the squid port, but didnt work.

How can I setup this local transparent proxy? This
notebook is not connected to any network and access
the internet via ppp. But it has a onboard network
card configured as 192.168.1.2=20

I have searched a lot and could not make it work,
please give me some help.

Does I have a misconfiguration? I use Slack 9.

Tks alot,
L.F.Estivalet


=09
	=09
__________________________________
Do you Yahoo!?
Yahoo! Photos: High-quality 4x6 digital prints for 25=A2
http://photos.yahoo.com/ph/print_splash

