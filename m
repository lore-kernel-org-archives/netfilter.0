From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: One outgoing connection per process
Date: Wed, 7 Apr 2010 10:25:06 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1004071021520.18320@obet.zrqbmnf.qr>
References: <k2ja39d6f081004062005y8a57e5cep53aad8ab9eceff19@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <k2ja39d6f081004062005y8a57e5cep53aad8ab9eceff19@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aleksandr Levchuk <alevchuk@gmail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2010-04-07 05:05, Aleksandr Levchuk wrote:

>Dear Netfilter Community,
>
>Is there a way to get Iptables to establish a limit of 1 outgoing TCP
>connection per process?
>
>Ideally I would like to dropping all new outgoing TCP connections from
>a process if that process already has 1 outgoing connection.

iptables has no notion of processes.
