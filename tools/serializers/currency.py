from rest_framework import serializers

from tools.models import Currency



class CurrencySerializer(serializers.ModelSerializer):

    class Meta:
        model = Currency
        fields = ['code', 'name', 'sequence']
