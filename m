From: Damon Gray <dgray@internap.com>
Subject: Re: Allowing access only some sites - onely some mac address
Date: Mon, 29 Aug 2005 16:02:06 -0400 (EDT)
Message-ID: <Pine.LNX.4.62.0508291601190.14997@dgray-test.acs.internap.com>
References: <006801c5acd1$b2ce1600$0301010a@pivt>
	<9255886c05082912495b3eff85@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-79754685-1048382484-1125345726=:14997"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9255886c05082912495b3eff85@mail.gmail.com>
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
To: Sp0oKeR <spooker@gmail.com>
Cc: netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---79754685-1048382484-1125345726=:14997
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE


Just wanted to point to what I think was the intended website:

http://ipset.netfilter.org


On Mon, 29 Aug 2005, Sp0oKeR wrote:

> I think ipset is a good idea.
>
> # ipmap
> The ipmap set type uses a memory range, where each bit represents one
> IP address and can store up to 65535 (B-class network) entries. You
> can store same size network addresses in an ipset as well and an IP
> address will be in the set if the network address it belongs to can be
> found in the set.
> # macipmap
> The macipmap set type uses a memory range, where each 8 bytes
> represents one IP and a MAC addresses. A macipmap set type can store
> up to 65535 (B-class network) IP addresses with MAC.
>
> Look http://ipsec.netfilter.org
>
> Att,
>
> Sp0oKeR
>
> On 8/29/05, Sebasti=E3o Ant=F4nio Campos (GWA) <sa.campos@datasulsp.com.b=
r> wrote:
>> Dears,
>>
>> I'd like to allow access only to some sites by some mac address.
>>
>> For example:
>>
>> I have a list of the mac address 00:0c:6E:11:E8:B0, 00:D8:02:D8:C8:DF,
>> 00:E7:05:C9:07:EA............ and and I'd like that only these mac addre=
ss
>> could access only the following IP: 200.221.2.128, 200.221.2.129,
>> 200.221.2.130, 200.221.2.131, 200.205.144.75, 200.205.144.76. But the ot=
her
>> mac address could access everything.
>>
>> How is the better way to do this??
>>
>> Thks
>>
>>
>>
>>
>
>
>
---79754685-1048382484-1125345726=:14997--

