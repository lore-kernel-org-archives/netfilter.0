From: Adam Young <adam@vbfx.com>
Subject: Re: [PATCH] associate user defined name with rule match
Date: Thu, 19 Sep 2002 07:46:25 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020919074625.007828aa.adam@vbfx.com>
References: <Pine.LNX.4.44L.0209172244330.10390-102000@hunger.screamingdaemon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44L.0209172244330.10390-102000@hunger.screamingdaemon.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tue, 17 Sep 2002 22:48:04 -0700 (PDT)
Jay Schulist <jschlst@linux-sna.org> wrote:


	Isn't this already available via --log-prefix ?  I've been using that for the
longest time, and if I want to see all hits on port 1433, I just say "grep MSSQL
/var/log/messages", for example, and it brings all of those up.

	Adam

> Hello Harald,
> Here is a new match which allows the user to associate a name with a rule.
> It is a very simple match, but it is useful if the user needs an easy way
> to track a rule by name.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9ibkRUanLvazj+VgRAjTHAJ9Wk6JZa11FTKyXB/BF095x1hBunQCfXH/S
jfF1zT8Gn7cbstJNVSUN6uI=
=MN++
-----END PGP SIGNATURE-----

