From: "Joris Dobbelsteen" <joris.dobbelsteen@mail.com>
Subject: RE: Enable Loopback confuse
Date: Sat, 20 Aug 2005 10:30:03 +0200
Message-ID: <B9833546B2643B43A56C4E962E13174602A9D3@nehemiah.joris2k.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

>-----Original Message-----
>From: netfilter-bounces@lists.netfilter.org=20
>[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of /dev/rob0
>Sent: vrijdag, 19 augustus 2005 15:18
>To: netfilter@lists.netfilter.org
>Subject: Re: Enable Loopback confuse
>
[snip]
>
>filter table            IP address
>built-in chains         source          destination
>----------------        ------          -----------
>INPUT                   *ANY*           local
>OUTPUT                  local           *ANY*
>FORWARD                 not local       not local
>
>Each packet is checked against the rules in only one of the=20
>built-in chains, *except* loopback traffic, which hits OUTPUT=20
>going out, and then INPUT coming in.
>

Thus your diagram should look like this, as you say below...

