From: Guy German <guy_g@rad.com>
Subject: RE: How does iptables NAT handle IPsec ESP with NAT-T UDP header ?
Date: Sun, 24 Jul 2016 18:00:53 +0000
Message-ID: <AM4PR0301MB227558E9AF3FA875F45DB35D910C0@AM4PR0301MB2275.eurprd03.prod.outlook.com>
References: <AM4PR0301MB227595822291E80D8CFB861A910A0@AM4PR0301MB2275.eurprd03.prod.outlook.com>
 <fa1bc371-408e-6508-4cf3-e0ee438fc55a@plouf.fr.eu.org>
 <AM4PR0301MB2275F18931456F441AEBA7B3910B0@AM4PR0301MB2275.eurprd03.prod.outlook.com>
 <4a1e6811-4d44-3b08-98af-95ecaad66dfb@plouf.fr.eu.org>
 <AM4PR0301MB22751A4F0B3DDAB0B41EF46C910C0@AM4PR0301MB2275.eurprd03.prod.outlook.com>
 <f5e03ced-5f06-7b21-16c3-cd68212f7e2a@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rad365.onmicrosoft.com; s=selector1-rad-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=PYZDWWXv72n4aLLtxPpIc68UgOARSliwzlQxbp9sHTQ=;
 b=iHYjpLADN2JPfFhfEF5wqm6Xa1z4XB229Y/MB6TRk76mhUxZ3mxIjoE2HpfcVzksP1nqZrfgoC5J7OuzUr0MmUE+dGFA3/acu+oSrym875ktRTDtfH2eJu+INowze0z2PWW1ytZqHwOc+7o4dj5MLZYOBK/l0zB31CpQ1XUk9CI=
In-Reply-To: <f5e03ced-5f06-7b21-16c3-cd68212f7e2a@plouf.fr.eu.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

VGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgYWxsIHlvdXIgaGVscCAhDQpHdXkNCg==
