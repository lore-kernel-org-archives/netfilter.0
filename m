From: Fabio Marcone <fabio.marcone@duet.it>
Subject: Re: tc and priority
Date: Tue, 26 May 2009 09:32:27 +0200
Message-ID: <4A1B9B0B.7090009@duet.it>
References: <4A142FF7.1050700@duet.it>	 <38db14850905210607s11fd9126i4bce902a668dfc6@mail.gmail.com>	 <4A15572D.3000303@duet.it>	 <38db14850905210722k7818822en4d9ceb072ad1c6b6@mail.gmail.com>	 <4A156620.6050904@duet.it>	 <38db14850905211115h68364107vef2ff69c9dc1f0f2@mail.gmail.com>	 <4A16937B.8020405@duet.it>	 <38db14850905221105l3e940df8y5eae3688f5a9028d@mail.gmail.com>	 <4A1A87C9.9030007@duet.it> <4A1AB178.2010107@duet.it> <38db14850905260010w7cfd2259q8fb291b36aec55f6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <38db14850905260010w7cfd2259q8fb291b36aec55f6@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
I run the same test witth this configuration:
 client ---------- server

with a 100 Mbs link. In this case high priority process has about 11 
MB/s and  low priority one has 400 KB/s. EUREKA! here the prio is correct!

I think that in the other tests using:
> ( client --- INTERNET--- router --- shaper1 --- server )
>   
with prio set in the server, high priority queue is not always full, maybe.

Now I will run some other test to deep understand the situation.

Thanks a lot,
Fabio
