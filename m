From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Understanding how nat works
Date: Tue, 21 Sep 2004 09:46:18 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF567950D@alderaan.smgtec.com>
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
To: Aleksandar Milivojevic <amilivojevic@pbl.ca>, netfilter@lists.netfilter.org

>> from the same machine I then tried to ping
>> 172.16.12.200 and I got nowhere.  When I deleted the
>> rule it worked fine.
>=20
> What machine has 172.16.12.167?  Usually you should SNAT only to
> address that is assigned to the machine/interface where you SNATing.

Try to read into ProxyARP. It will give you some insights as to why what
you describe doesn't work without either proxyARP or the IP address
bound to your network card.

