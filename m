From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: debugging iptables
Date: Mon, 17 Jun 2002 22:12:17 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206172112.g5HLCMA23419@Networker.rockstone.co.uk>
References: <20020617165903.4b7ac76a.mt@open2web.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020617165903.4b7ac76a.mt@open2web.com>
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

On Monday 17 June 2002 9:59 pm, Mark Tessier wrote:

> iptables v1.2.1a: host/network `smtpx.xxxx.xx' not found
> Try `iptables -h' or 'iptables --help' for more information.

[ Etc..... ]

What are the values of the variables $SMTP_SERVER and $POP_SERVER in your 
script ?

> I'm not sure why the script causes these error messages, while others like
> accessing an HTTP server doesn't produce any error mesages. DNS rules are
> prior to these rules.

What are your DNS rules ?

 

Antony.

