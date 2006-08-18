From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: block multimedia protocols
Date: Fri, 18 Aug 2006 14:37:23 +0200 (CEST)
Message-ID: <50222.193.173.147.3.1155904643.squirrel@webmail.sterenborg.info>
References: <200608181400.37490.matteo@cisilino.com>
	<58801.193.173.147.3.1155903008.squirrel@webmail.sterenborg.info>
	<200608181415.31321.matteo@cisilino.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200608181415.31321.matteo@cisilino.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org


On Fri, August 18, 2006 14:15, matteo@cisilino.com wrote:
> Alle 14:10, venerd=C3=AC 18 agosto 2006, Rob Sterenborg ha scritto:
>
>> On Fri, August 18, 2006 14:00, matteo@cisilino.com wrote:
>>
>>> Hi all , I'd like to know if there's a way to block certain multimedi=
a
>>> casting protocols , Is it possible?
>>
>> What do you have in mind?
>>
> Hi rob, i want to stop streamings. I can't stop single ports becouse th=
e
> server can bind on many differente ports , can't block the single desti=
nation
> ip becouse are too much , so i tought that there's a possibility to che=
ck the
>  single packet.

AFAICS you'd need helpers for that. In POM-ng (extra) are a few helpers
available, but I don't know if these cover your needs:

http://www.netfilter.org/projects/patch-o-matic/pom-extra.html#pom-extra-=
mms-conntrack-nat
http://www.netfilter.org/projects/patch-o-matic/pom-extra.html#pom-extra-=
rtsp-conntrack

You could match for MMS and RTSP traffic and then just DROP the packets.


Gr,
Rob



