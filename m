From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Modules
Date: Mon, 10 Mar 2003 18:13:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005a01c2e728$69bb35e0$0401000a@sterenborg.info>
References: <4D613EBFB75BD6118A5B00508BEEC62C0111CB8A@JESS>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4D613EBFB75BD6118A5B00508BEEC62C0111CB8A@JESS>
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

> I am loading these modules to get FTP working, however they=20
> are no auto loading so each time i restart the server i havbe=20
> to manually reload them insmod ip_nat_ftp=20
> insmod ip_conntrack_ftp=20

You can also put them in /etc/rc.d/rc.local or in your iptables script.


Rob


