From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: virus scanning with iptables
Date: Thu, 9 Sep 2004 16:26:39 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E36E@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Khanh Tran <khanh@slc.edu>, netfilter@lists.netfilter.org

Khanh Tran wrote:
> Is any using a virus scanning application with iptables?  I'd like to
> know if it's possible for me to detect viruses that go across my
> iptables firewalls.

There isn't currently a tool to perform Virus scanning of iptables data.
The closest match would be snort-inline which can locate some virus
signatures. Inline scanning of anything can have averse effects on the
transmission. You'll quickly find that detailed scans require a lot of
CPU usage. Just for monitoring network thoughtput with ntop, I'd max out
my P4 CPU when backups kicked off.

The better approach would be to implement transparent proxies of
pertinent services like SMTP and use virus scanning addons. for them.
You may also look at the 'l7-filter' project or the 'string' extension
to see if their implementation suits your needs.

