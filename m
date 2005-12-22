From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: block port 25
Date: Thu, 22 Dec 2005 09:21:47 +0100 (CET)
Message-ID: <52481.193.173.147.3.1135239707.squirrel@webmail.sterenborg.info>
References: <60035ee50512212353h500f5cbdgea6094fe99713b18@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <60035ee50512212353h500f5cbdgea6094fe99713b18@mail.gmail.com>
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
To: Denny <denny@mypolaris.com>
Cc: netfilter@lists.netfilter.org

On Thu, December 22, 2005 08:53, Denny wrote:
> is there a way to block all incoming and outgoing access to port 25,
> with only one exception if it is going through a legitimate mail
> server.

Sure.
First allow email to the legitimate email server, then block
everything else to port 25.

# Accept NEW packet coming in from <smtp-server> to smtp port 25.
$ipt -A INPUT -m state --state NEW -s <smtp-server> \
  -p tcp --dport 25 -j ACCEPT

# Drop other NEW packets going to smtp port 25
$ipt -A INPUT -m state --state NEW -p tcp --dport 25 -j DROP


# Accept NEW packet going out to <smtp-server> on smtp port 25.
$ipt -A OUTPUT -m state --state NEW -d <smtp-server> \
  -p tcp --dport 25 -j ACCEPT

# Drop other NEW packets going out to smtp port 25.
$ipt -A OUTPUT -m state --state NEW -p tcp --dport -j DROP


Gr,
Rob



