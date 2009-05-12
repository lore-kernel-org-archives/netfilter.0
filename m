From: Tino Keitel <tkeitel@innominate.com>
Subject: Re: How to use mark and connmark in one rule
Date: Tue, 12 May 2009 15:01:55 +0200
Message-ID: <20090512130155.GB19645@tkeitel002.bln.innominate.local>
References: <20090424133235.GA14156@tkeitel002.bln.innominate.local> <49F1C165.60907@freemail.hu> <20090424134920.GA16262@tkeitel002.bln.innominate.local> <49F1C4DE.2070006@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <49F1C4DE.2070006@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Fri, Apr 24, 2009 at 15:55:42 +0200, G=E1sp=E1r Lajos wrote:
> Tino Keitel =EDrta:
>>> If you want then rename one of the options...
>>> The problem is that both connmark and mark have a --mark option...
>>>    =20
>>
>> Yes, that's why I renamed the connmark parameter to --conmark to mak=
e
>> it work. But I want to be sure that I don't break something (except =
for
>> all scripts that use -m connmark --mark), or if there is a way to ev=
en
>> make this work without patching.
>>
>>  =20
> I think that you won't break anything... just those scripts...

Great, thanks.

Regards,

--=20
Tino Keitel
Software Engineer
=20
Innominate Security Technologies AG
/protecting industrial networks/
Tel: +49.30.921028-206
=46ax: +49.30.921028-020
Rudower Chaussee 13
12489 Berlin / Germany
http://www.innominate.com/

----------------------------------------------------------------
Visit us at the Hannover Messe in Germany
20 - 24 April 2009, Hall 9, Stand F54
----------------------------------------------------------------

Register Court: AG Charlottenburg, HRB 81603 Management Board: Dirk
Seewald, Chairman of the Supervisory Board: Volker Bibelhausen

INNOMINATE HAS MOVED. PLEASE NOTE THAT OUR BUSINESS CONTACT DATA HAS
CHANGED.
