From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Windows file sharing over different subnets
Date: Thu, 27 Mar 2003 12:15:22 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122DA6@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

1. Is File sharing enabled on the win98 box? I am not sure it is
'visible' without it.

2. The server is trying to find NetBIOS String ("192.168.2.2") on the
network, which will fail. The followup would be to search WINS for it.
If the WINS server on windows 2000 does not have that computer
registered, then the machine cannot be resolved. Can you look at your
wins server on 192.168.1.3 and see an entry for your win98 clients that
allegedly registered with it?

3. Make sure the win98 computers are configured for wins automatically.
Sometimes it is set for manual or disabled wins settings.



