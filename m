From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: bridges are not self contained
Date: Tue, 30 Aug 2011 08:19:43 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1108300817530.16013@frira.zrqbmnf.qr>
References: <CAKrOiPTKyAezXpr__BmRLZRiweh_L+xFjw5Nj7FA1qCoRd3Bdw@mail.gmail.com> <alpine.LNX.2.01.1108291656120.20075@frira.zrqbmnf.qr> <CAKrOiPS23ahg33HEpK2cU9472RM6dW2aD2vKWzmfKt-_yyyOcw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKrOiPS23ahg33HEpK2cU9472RM6dW2aD2vKWzmfKt-_yyyOcw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: naruto canada <narutocanada@gmail.com>
Cc: netfilter@vger.kernel.org

On Monday 2011-08-29 17:16, naruto canada wrote:
>>>
>>>I am a new user of ebtales. (bridges) Just started experimenting, I 
>>>run into one problem immediately: all the bridges can see traffic on 
>>>ethernet card that are NOT connected to the bridges.
>>
>>On what do you base this assertion?
>
>Hold on, I think have a physically loop, I will disconnect that line, 
>and make sure it is not from another physical switch, then I can be 
>sure it is the kernel (or bridge code) that is forwarding the packets.
>
>Answering your question: I know they are vitual bridges, but should not 
>be magical (kernel should not automatically send broadcast packets onto 
>all vitual bridges without passing through ports connected to them.)

(For starters, don't strip the cc.)

Nobody but you said they are magical (or virtual for that matter), so 
the question was merely implying that you may have a configuration 
error, or using bugzilla terms: "WORKSFORME".
