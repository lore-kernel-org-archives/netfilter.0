From: Nuitari <nuitari@balthasar.nuitari.net>
Subject: Re: FTP/auth problems (slooow links)
Date: Mon, 14 Oct 2002 05:52:26 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210140550590.18466-100000@balthasar.nuitari.net>
References: <3DA9D952.3030709@solidas.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DA9D952.3030709@solidas.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sun, 13 Oct 2002, Svein E. Seldal wrote:
> So, I'm rephrasing the question: "What can be the reason that the router 
> is having such long initial delays on connections?"

Did you check that all the ip that are used to connect have some kind of 
entry in /etc/hosts or can be resolved quickly with a DNS server. 
I noticed some ftp daemons are doing a reverse resolving of the ip and if 
the domain name server is innaccessible or slow it can take a long time 
for the time outs.


