From: "Nathan Cassano" <nathan@cjhunter.com>
Subject: RE: About mangle table
Date: Wed, 12 Jun 2002 07:56:53 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <0d6401c21221$66a7d110$2901a8c0@amos>
References: <EPEFJKLDAJCANCAHGNDCOEIEFJAA.pgotsis@btinternet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <EPEFJKLDAJCANCAHGNDCOEIEFJAA.pgotsis@btinternet.com>
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


Make sure that both the mark modules are loaded.

modprobe ipt_mark
modprobe ipt_MARK

> The error I get is:
> 'iptables v1.2.6a: Bad MARK value `1
> Try `iptables -h' or 'iptables --help' for more information.


