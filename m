From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: [Help] Allow website using iptables
Date: Mon, 11 May 2020 13:34:19 +0200
Message-ID: <4dbf6222-2ead-d2b5-68db-cdd49028b6ef@thelounge.net>
References: <CA+u3GuKsm8o1nv_iJ6kSYHWzrfgCpZsVZKbDq4FmnuCFwOL3BQ@mail.gmail.com>
 <3EDC495D-8AD1-4687-8496-B17E3CCEB158@oracle.com>
 <CAByCkvp30Pcb3ZfNUQ54mcBZ9HnhYqEJ0R3KZDQM+6_hzNQw7w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAByCkvp30Pcb3ZfNUQ54mcBZ9HnhYqEJ0R3KZDQM+6_hzNQw7w@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?U8ahbiDEkOG7lw==?= <sondd1096@gmail.com>, netfilter@vger.kernel.org



Am 11.05.20 um 12:20 schrieb Sơn Đỗ:
> Do you guys have any idea to allow a certain website with a specific
> MAC address ?

that's not how the ip layer works
you don't have any MAC adress after a router

don#t get me wrong but you need to learn the absolute basics about
networking: https://en.wikipedia.org/wiki/OSI_model

> Vào Th 2, 4 thg 5, 2020 vào lúc 21:00 John Haxby
> <john.haxby@oracle.com> đã viết:
>>
>>
>>
>>> On 4 May 2020, at 09:54, Lazuardi Nasution <mrxlazuardin@gmail.com> wrote:
>>>
>>> YouTube use SSL. So you can't match strings inside the packet, it is
>>> encrypted.
>>
>> Actually, in most cases you can: the first packet set will usually have the hostname in the SNI extension header
