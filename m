From: Arturo Borrero Gonzalez <arturo@netfilter.org>
Subject: Re: Create set and/or chain accessible across multiple tables
Date: Wed, 23 Aug 2017 12:42:21 +0200
Message-ID: <CAOkSjBjkO8J7RGUqGSb_nqTTe7roeoMgqd0FnC7+0h_4iz9FQw@mail.gmail.com>
References: <02c72729-72ab-1947-53b7-0a3cbaff4d7a@wagsky.com> <CAOkSjBiqzd5PHuFU=_sctb4JxRC0_ibmgcVkgDL8C9qANrCFMQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAOkSjBiqzd5PHuFU=_sctb4JxRC0_ibmgcVkgDL8C9qANrCFMQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Kletsky <netfilter@allycomm.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

BTW, you can reuse the set declaration by using variables:

define ports = {1,2,3,4,5}
[..]
set set1 {
       type inet_service;
       elements = $ports
}
set set2 {
       type inet_service;
       elements = $ports
}
