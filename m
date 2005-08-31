From: =?ISO-8859-15?Q?St=E9phane_BENOLIEL?= <sbenoliel@aacom.fr>
Subject: Re: Source NAT
Date: Wed, 31 Aug 2005 13:33:59 +0200
Message-ID: <431595A7.5050608@aacom.fr>
References: <58867.212.100.225.55.1125487119.squirrel@webmail.*>
	<4315950A.4000300@aacom.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------040705060804090902020905"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4315950A.4000300@aacom.fr>
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------040705060804090902020905
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by pps.aacom.fr id
	j7VBY5gU029620

St=E9phane BENOLIEL wrote:

> Jimmy wrote:
>
>> Hello,
>>
>> I currently have a situation that I am hoping iptables can resolve. Th=
e
>> issue is that I need to NAT the source address based on the destinatio=
n
>> address. Is that possible with IPTables ?
>>
>> For example
>>
>> if dst =3D 1.1.1.1 src =3D 10.1.1.1
>> if dst =3D 1.1.2.1 src =3D 10.1.1.2
>> =20
>>
> You can use DNAT
> for exemple:
>
> iptables -t nat -A PREROUTING -s 1.1.1.1 -j DNAT =20
> --to-destination10.1.1.1
>

sorry.... mistmach...... the good solution is :

iptables -t nat -A PREROUTING -d 1.1.1.1 -j DNAT  --to-destination10.1.1.=
1

>> Can anyone give me any advice on completing that?
>>
>> Regards,
>>
>>
>>
>>
>> =20
>>
>


--------------040705060804090902020905--

