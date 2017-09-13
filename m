From: Arturo Borrero Gonzalez <arturo@netfilter.org>
Subject: Re: NFLOG Performance issues ...
Date: Wed, 13 Sep 2017 11:36:57 +0200
Message-ID: <CAOkSjBjSw=5j71Mgi0XnDJXkRDod3qD_YcWR4hZ7dUfzUmddbQ@mail.gmail.com>
References: <CAA5aLPgoCdJcFZk0iScnNXNPjv04XbkFEdfAjpwq32u4xd8zPg@mail.gmail.com>
 <CAA5aLPgAktg8etg=Zq0ihbcTB0F9MyDf_KQaVRNHQi-ubWdJXQ@mail.gmail.com>
 <20170901094319.GA2519@salvia> <CAA5aLPgxg5pSh1HJ6z5C1wiWXzrjCXj70wFe9_JESFfLgES1rw@mail.gmail.com>
 <CAA5aLPhjaOat800R+Wk4cqScw0YGxWx_UnHAfzT3Ln5NrUXhCw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAA5aLPhjaOat800R+Wk4cqScw0YGxWx_UnHAfzT3Ln5NrUXhCw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Akshat Kakkar <akshat.1984@gmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 5 September 2017 at 14:50, Akshat Kakkar <akshat.1984@gmail.com> wrote:
> I am not able to log more than 150/sec.
>
> Can anybody share their performance results when writing logs from
> NFLOG/ULOG to postgres or mysql.
>
> Please share your performance parameters too.
>

Hi,

I sent a patch other day regarding performance of ulogd2 [0].
Please, read the patch description, where I summarice different
approaches for increasing the performance of the daemon.

It would be great if could give a test to the patch and report back :-)

[0] http://patchwork.ozlabs.org/patch/810976/
