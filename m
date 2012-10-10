From: Arturo Borrero <aborrero@cica.es>
Subject: [ipset] adding a fqdn and get all A or AAAA registers in the set
Date: Wed, 10 Oct 2012 15:13:33 +0200
Message-ID: <CAPfcJatY3XEfyE8YmBwMZQQkQ5gkVdnxdaSsm0cj1d9u3_Bz5A@mail.gmail.com>
References: <CAPfcJasWf=w1U=wK=ErOH+w6veOgUdjTFbp1JiqjXVYE=7Ay0w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAPfcJasWf=w1U=wK=ErOH+w6veOgUdjTFbp1JiqjXVYE=7Ay0w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi there!

I've been doing some test, and I'm unable to get all A or AAAA register=
s of
a FQDN inside a set (i.e. hash:ip).

Try it yourself:

$ host dl.dropbox.com
[6 ips]
# ipset create hash:ip test
# ipset add test dl.dropbox.com
# ipset list test
[just 1 ip]

I took a look at the source of ipset (on git repo), but I was unable to
determine where in the code the desition of drop (or ignore) additional=
 DNS
resolutions is being taken. (Yes, i'm a noob programmer)

Any idea?

Best regards.


--
Arturo Borrero Gonz=E1lez
Departamento de Seguridad Inform=E1tica, @NIS_CICA (twitter)
Centro Informatico Cientifico de Andalucia (CICA)
Avda. Reina Mercedes s/n - 41012 - Sevilla (Spain)
Tfno.: +34 955 056 600 / FAX: +34 955 056 650
Consejer=EDa de Econom=EDa, Innovaci=F3n, Ciencia y Empleo
Junta de Andaluc=EDa
