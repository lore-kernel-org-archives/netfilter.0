From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: ipt_string...
Date: Thu, 6 May 2004 10:58:04 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122F4F@alderaan.smgtec.com>
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
To: udo <udovdh@yahoo.com>, netfilter@lists.netfilter.org

If you expect the string data on a specific port, you can narrow down
the number of packets searched. Basically, the best way to cut down CPU
is the ability to tell what 'isn't' in the string. Eg: If your traffic
is some unknown protocol, anything RELATED doesn't need to get string
matched. If you're just doing firewall based content filtering (not
ideal) then you'd just use the string match on inbound tcp spt 80 and
block tcp spt 443.

As for the size of the string, I highly doubt that having different
string lengths would make much of a performance hit. The search still
has to traverse the entire packet regardless of how long the string is.
The developer may say differently, but I don't see an advantage of
either way.

