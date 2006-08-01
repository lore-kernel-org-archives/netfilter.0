From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: block 8080, but redirect from 80 to 8080
Date: Tue, 01 Aug 2006 14:11:41 +0200
Message-ID: <44CF44FD.9010906@plouf.fr.eu.org>
References: <44CED45F.10208@xsoftware.biz> <44CF3120.4080008@plouf.fr.eu.org>
	<44CF3E31.3080001@whb.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44CF3E31.3080001@whb.hu>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Netfilter IPtableMailinglist <netfilter@lists.netfilter.org>

G=E1sp=E1r Lajos a =E9crit :
>=20
>> Quick and dirty :
>> Drop the undesired packets in the PREROUTING chain of the 'mangle'=20
>> table, before REDIRECT occurs.
>>
>> iptables -t mangle -A PREROUTING -p tcp --dport 8080 -j DROP (or REJEC=
T)
>>
> I would recomment NOT TO DO any ACCEPT or DROP/REJECT in other than the
> filter table...

I agree, that's why I mentionned "quick and _dirty_" and suggested a=20
better solution based on marks. However I think ACCEPT is an acceptable=20
target in any table, not only in 'filter'.

By the way, I made a mistake : REJECT is a valid target only in the=20
'filter' table, showing if necessary that the other tables are not=20
intended for filtering.

