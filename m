From: Shane Hickey <shane@howsyournetwork.com>
Subject: Re: Port forwarding with multiple public IPs
Date: Thu, 25 Mar 2004 12:40:45 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040325124045.241a5e90@localhost>
References: <7C9884991ADAE0479C14F10C858BCDF5122F2D@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122F2D@alderaan.smgtec.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Chemko <dchemko@smgtec.com>
Cc: netfilter@lists.netfilter.org

"Daniel Chemko" <dchemko@smgtec.com> [2004-03-25 11:08]:
> Remove all of your reverse-SNAT rules. They are automagically handled
> implicitly.

Woah.  I removed those lines and gave 'er a go and it just worked.  I
must have fat-fingered something last night.  

Thanks!

-- 
Shane Hickey <shane@howsyournetwork.com>: Network/System Consultant
GPG KeyID: 777CBF3F
Key fingerprint: 254F B2AC 9939 C715 278C  DA95 4109 9F69 777C BF3F
Listening to:
My_Bloody_Valentine_-_Esctacy_And_Wine_-_04_-_She_Loves_You_No_Less

