From: "Ruben Cardenal" <rubenc@arrakis.es>
Subject: RE: Problem adding connlimit rule
Date: Tue, 10 May 2005 15:21:27 +0200
Message-ID: <39983.3577023402$1115730916@news.gmane.org>
References: <1115725891.948.1.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1115725891.948.1.camel@nostromo.bgsecm.com>
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

Hi,

netfilter-bounces@lists.netfilter.org wrote:
> El mar, 10-05-2005 a las 13:26 +0200, Ruben Cardenal escribi=F3:
>> Hi,
>>=20
>>   I'm trying to add a quite simple rule but I get an error:
>>=20
>> # iptables -I INPUT -p tcp --syn --dport 25 -m connlimit
>> --connlimit-above 10 -j REJECT iptables: No chain/target/match by
>> that name=20
>=20
> Maybe you don't have the support for the connlimit match compiled
> for iptables. Check if you have the file:
> /lib/iptables/libipt_connlimit.so

  For this system libs are located under /usr/local/lib/iptables and
libipt_connlimit.so is there.

  Regards,

- Ruben


