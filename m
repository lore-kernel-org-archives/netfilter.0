From: vaida bogdan <vaida.bogdan@gmail.com>
Subject: allowing ssh in campus
Date: Wed, 18 May 2005 00:42:26 +0000
Message-ID: <12848a3b050517174268bc6b79@mail.gmail.com>
Reply-To: vaida bogdan <vaida.bogdan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

My campus connections look like this:

Dorm1 gateway ----\
Dorm2 gateway ----|=3D> Campus gateway |-> OUTSIDE
Dorm3 gateway ----/                                  \-> University Servers

Dorms' ips are private on different internal networks.

I want to allow ssh (and other ports) access on request to users from
one of the Dorms to OUTSIDE.

If I allow Student1 ssh on dorm1 gateway then what do I tell the
Campus gateway to allow ? (I can't allow full access from Dorm1's
gateway public ip.

I would also like to consider security matters: (allow by ip&mac, or
through proxy).

Thanks in advance,
   Bogdan

