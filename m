From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Problem with arp and brouting
Date: Wed, 17 Aug 2016 19:22:50 +0200
Message-ID: <6ec5c4f9-84c4-eb34-6206-8a5b1aab4fcd@plouf.fr.eu.org>
References: <CAMXC=WtL_ELrLTh5adh_HF9zu4_KogYGFiCkrEgWrbVZTuGKmA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMXC=WtL_ELrLTh5adh_HF9zu4_KogYGFiCkrEgWrbVZTuGKmA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Alfredo Rezinovsky <alfrenovsky@gmail.com>
Cc: netfilter@vger.kernel.org

Le 17/08/2016 à 18:13, Alfredo Rezinovsky a écrit :
>
> The other problem is that usually G has lots of IPs (G1, G2...) in
> many networks, each one with one router (R1, R2...)

Why is that so ?

> Lets suppose the Bridge has and IP in the first network (B1).
(...)
> Because B1 is in subnet 1 and R2 is in other subnet, some routers wont
> answer the ARP request (CISCO for example)
>
> Any solution without the need to add a permanent neigh entry for R2?

Configure all the routers in the same subnet.
