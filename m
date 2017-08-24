From: Arturo Borrero Gonzalez <arturo@netfilter.org>
Subject: Re: Hints needed to find causes of non-specific error messages
Date: Thu, 24 Aug 2017 08:35:33 +0200
Message-ID: <CAOkSjBhNROxwP3d_jAQ7Q1ou_SmYE3_jJuFah8-YBKoQ4tN=ng@mail.gmail.com>
References: <0628e05b-00cb-0135-3ffc-c44dcb4634b3@wagsky.com>
 <0ea79422-035e-6a2a-d416-937f32615e89@wagsky.com> <7c9cc6db-30be-5b89-7030-5ea3bec04c8b@wagsky.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7c9cc6db-30be-5b89-7030-5ea3bec04c8b@wagsky.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Kletsky <netfilter@allycomm.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 23 August 2017 at 23:00, Jeff Kletsky <netfilter@allycomm.com> wrote:
> Found the root cause -- duplicate chain name (prer_r) within the same table
> after all the sed-ing to shorten things.
>
> The error messaging truly needs to be a lot better.
>
>
> The question of the permitted identifier length is still outstanding.
>

I replied to your other email thread regarding this very same questions.

Please, don't flood the mailing list with same question in different threads.

thanks.
