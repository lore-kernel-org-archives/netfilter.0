From: =?ISO-8859-1?Q?Z=E9=20Lu=EDs?= <zeluis@objetivo-americana.com.br>
Subject: squid and iptables
Date: Fri, 14 Jun 2002 11:12:12 -0300
Sender: netfilter-admin@lists.samba.org
Message-ID: <aectl4$psh$2@main.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org

Hi,

i have a network with squid authentication on port 3128 and acl's 
controls. My users only surf with password authentication.

I don't control access port with squid acl. All ports is free by squid.

But,

i need control wich ports each machine can access by iptables. Is it 
possible?

My idea is :

- squid do not control ports, only url_path, urlpath_regex, time, password.

- iptables open and close ports (from internal mchines to internet) for 
data from proxy and other (telnet, irc, ssh and all other)

My question:

- Is it possible.

if yes:

- what chain use?
- a example, plase ;-)

if no:

- what's betther way to do this


Thanks, thanks, thanks.

Ze Luis








