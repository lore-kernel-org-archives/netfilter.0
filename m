From: Christian Hammers <ch@westend.com>
Subject: /proc/net/ip_conntrack filling without ipt_conntrack.o loaded?
Date: Tue, 14 Jan 2003 13:12:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030114121232.GA3362@westend.com>
References: <20030114093711.GC9940@westend.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030114093711.GC9940@westend.com>
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
To: netfilter@lists.netfilter.org

Hello

I had ipt_conntrack.o loaded (see last mail) and then removed. But still
my /proc/net/ip_conntrack got filled up.
Then I did "echo '10000' > /proc/sys/net/ipv4/ip_conntrack_max" and it=20
still raised.
Now, after waiting 10min or so the values are slightly falling (I had
fear that it crashed when reaching 0xffff)..

Are the first two events signs for a bug or is it expected behaviour
that somehow the conntrack code remains in the kernel even if the module
has been removed?

bye,

-christian-

--=20
Christian Hammers             WESTEND GmbH  |  Internet-Business-Provider
Technik                       CISCO Systems Partner - Authorized Reseller
                              L=FCtticher Strasse 10     Tel 0241/701333-11
ch@westend.com                D-52064 Aachen              Fax 0241/911879


